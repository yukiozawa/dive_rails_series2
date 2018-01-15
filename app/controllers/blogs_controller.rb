class BlogsController < ApplicationController
     before_action :set_blog, only: [:show, :edit, :update, :destroy]
     before_action :login_redirect, only: [:new, :edit, :show]

    def index
        @blogs = Blog.all
    end

    def new
        if params[:back]
            @blog = Blog.new(blog_params)
        else
            @blog = Blog.new
        end
    end

    def create
        @blog = Blog.new(blog_params)

        if @blog.save
        # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
            redirect_to blogs_path, notice: "ブログを作成しました！"

        else
        # 入力フォームを再描画します。
            render 'new'
        end

    end

    def edit

    end

    def show

    end

    def destroy
        @blog.destroy
        redirect_to blogs_path, notice:"ブログを削除しました！"
    end

    def update
        @blog = Blog.find(params[:id])
        if @blog.update(blog_params)
            redirect_to blogs_path, notice: "ブログを編集しました！"
        else
            render 'edit'
        end
    end

    def confirm
        @blog = Blog.new(blog_params)
        render :new if @blog.invalid?
    end

    def login_redirect
        unless logged_in?
            redirect_to root_path, notice: "閲覧権限がありません。トップページにリダイレクトしました。"
        end
    end

    private
    def blog_params
        params.require(:blog).permit(:title, :content)
    end

    def set_blog
      @blog = Blog.find(params[:id])
    end


end
