class PostsController < ApplicationController
  before_action :set_condominium, only: [:new, :create, :index]

  def index
    @posts = Post.where(condominium_id: @condominium.id).order(created_at: :desc)
  end

  def new
    @post = Post.new
    @posts = Post.where(condominium_id: @condominium.id).order(created_at: :desc)
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.condominium = @condominium
    if @post.save
      respond_to do |format|
        format.html { redirect_to condominium_path(@condominium), notice: 'Postagem criada com sucesso!' }
        format.text { render partial: "posts/card", locals: { post: @post }, formats: [:html] }
      end
      # redirecionar para a home do condomínio, para a parte da página referente ao my posts/interações?
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    condominium = @post.condominium
    if @post.update(post_params)
      redirect_to condominium_posts_path(condominium), notice: 'Postagem atualizada com sucesso'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user == current_user || current_user.admin?
      comments = Comment.where(post_id: @post.id)
      comments.destroy_all
      if @post.destroy
        redirect_to new_condominium_post_path(@post), notice: "Postagem Excluída com sucesso."
      else
        redirect_to new_condominium_post_path(@post), alert: "Você não tem permissão para excluir esta postagem."
      end
    end
  end

  private

  def set_condominium
    @condominium = Condominium.find(params[:condominium_id])
  end

  def post_params
    params.require(:post).permit(:content, :photo)
  end

end
