class OperatorsController < ApplicationController

    def index
      @operators = Operator.all
    end

    def new
      @operator = Operator.new
    end

    def create
      Operator.create(operator_params)
      flash[:notice] = "Operator successfully created =)"
      redirect_to operators_path
    end

    def edit
      @operator = Operator.find(params[:id])
    end

    def update
      @operator = Operator.find(params[:id])
      @operator.update_attributes(operator_params)
      flash[:notice] = "Operator was successfully updated =)"
      redirect_to operators_path
    end

    def destroy
      @operator = Operator.find(params[:id])
      @operator.destroy
      flash[:notice] = "Operator was successfully deleted =)"
      redirect_to operators_path
    end

    private
      def operator_params
        params.require(:operator).permit(:name,:department_id)
      end

end
