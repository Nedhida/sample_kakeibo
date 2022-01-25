class IncomesController < ApplicationController

  def index
    # 並び順を昇順で指定
    @incomes = Income.order(created_at: :asc)
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

end
