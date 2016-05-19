class ContactsController < ApplicationController
  before_action :find_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = Contact.all.order("created_at DESC") 
  end

  def show
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contacts_params)
    if @contact.save
      redirect_to @contact
    else
      render "New"
    end
  end

  def edit
  end

  def update
    if @contact.update(contacts_params)
      redirect_to @contact
     else
      render "Edit"
     end
  end

  def destroy
    @contact.destroy
    redirect_to root_path
  end

  private

  def contacts_params
    params.require(:contact).permit(:name, :title, :location, :description, :image)
  end

  def find_contact
    @contact = Contact.find(params[:id])
  end
end
