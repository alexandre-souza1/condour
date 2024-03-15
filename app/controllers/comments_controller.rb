class CommentsController < ApplicationController
  before_action :set_post

  #def index
  #  @comments = Comment.where(post_id: @post.id)
  #  @comment = Comment.new
  #end

  def new
    @comments = Comment.where(post_id: @post.id)
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = @post
    if @comment.save
      redirect_to condominium_path(@condominium), notice: 'Comentário criado com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    if @comment.update(comment_params)
      redirect_to condominium_path(@condominium), notice: 'Comentário atualizado com sucesso'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user == current_user || current_user.role.present?
      @comment.destroy
      redirect_to condominium_path(@condominium), notice: "Comentário excluído com sucesso."
    else
      redirect_to condominium_path(@condominium), alert: "Você não tem permissão para excluir esta postagem."
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
