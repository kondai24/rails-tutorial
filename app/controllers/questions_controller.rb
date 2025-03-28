class QuestionsController < ApplicationController
  # 質問一覧表示
  def index
    @questions = Question.all
  end

  # 質問の詳細ページ表示
  def show
    @question = Question.find(params[:id])
  end

  # 質問の作成
  def new
    @question = Question.new
  end

  # 質問の登録
  def create
    @question = Question.new(question_params)
    # バリデーションのチェック
    if @question.save
      redirect_to @question
    else
      render "new", status: :unprocessable_entity
    end
  end

  # 質問の編集
  def edit
    @question = Question.find(params[:id])
  end

  # 質問の更新
  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to @question
    else
      render "edit", status: :unprocessable_entity
    end
  end

  # 質問の削除
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  private
  def question_params
    params.require(:question).permit(:title, :name, :content)
  end
end
