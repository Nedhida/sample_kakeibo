class FixedcostsController < ApplicationController

def index
	@fixedcosts = Fixedcost.order(created_at: :asc)
end

def show
	@fixedcost = Fixedcost.find(params[:id])
end

def new
	@fixedcost = Fixedcost.new()
end

def edit
	@fixedcost = Fixedcost.find(params[:id])
end

def create
	@fixedcost = Fixedcost.new(params[:fixedcost])
	if @fixedcost.save
		redirect_to @fixedcost, notice: "固定費科目を登録しました"
	else
		render "new"
	end

end

def update
	@fixedcost = Fixedcost.find(params[:id])
	@fixedcost.assign_attributes(params[:fixedcost])
	if @fixedcost.save
		redirect_to @fixedcost, notice: "固定費科目を登録しました"
	else
		render "new"
	end


end

def destroy
	@fixedcost = Fixedcost.find(params[:id])
	@fixedcost.destroy
	redirect_to :fixedcosts, notice: "科目を削除しました。"
end


end
