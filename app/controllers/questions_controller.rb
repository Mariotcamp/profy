class QuestionsController < ApplicationController
  def create
    Question.create(create_params)
    redirect_to :root and return
  end
  
  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
  end
  
  private
  def create_params
    params.require(:question).permit(:text).merge(user_id: current_user.id,group_id: current_user.group_id)
  end
end
#何故ここでmergeメソッドを使ったのか、index.html.erbからくるハッシュはひとつにまとまってないのか？
#まずpermitで受け取れるのはparamsに含まれるものだけである,そもそもuser,group_idはindexから送られてないし。user_id:current_use.idはこれ自体でハッシュになる