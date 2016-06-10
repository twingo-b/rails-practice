class CommentsController < ApplicationController
  before_action :set_blog_and_entry
  before_action :set_comment, only: [:approve, :destroy]

  # POST /comments
  # POST /comments.json
  def create
    @comment = @entry.comments.new(comment_params)

    respond_to do |format|
      if @comment.save
        Comments.post_notification(@blog, @entry, @comment).deliver_now
        format.html { redirect_to blog_entry_path(@blog, @entry), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { redirect_to blog_entry_path(@blog, @entry) }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1/approve
  # PATCH/PUT /comments/1/approve.json
  def approve
    respond_to do |format|
      if @comment.update(status: 'approved')
        format.html { redirect_to blog_entry_path(@blog, @entry), notice: 'Comment was successfully approved.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to blog_entry_path(@blog, @entry), notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog_and_entry
      @blog = Blog.find(params[:blog_id])
      @entry = @blog.entries.find(params[:entry_id])
    end

    def set_comment
      @comment = @entry.comments.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.fetch(:comment).permit(:body)
    end
end
