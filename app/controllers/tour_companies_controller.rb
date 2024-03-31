class TourCompaniesController < ApplicationController
    def index
        @user_now = current_user
        puts @user_now
        @company = TourCompany.find_by(user_id: @user_now.id)
        
        if @company.nil? 
            redirect_to new_tour_company_path
        else
            redirect_to tour_company_path(@company)
        end
    end
    
    def new
        @user_build = current_user.build_tour_company
        @tour_comp = current_user.build_tour_company
    end

    def create
        @tour_comp = current_user.build_tour_company(tour_company_params)
        
        if @tour_comp.save
            redirect_to tour_company_path(@tour_comp)
        else 
            puts @tour_comp.errors.full_messages
            render :new
        end
    end
    def show
        @user_now = current_user
        @company = TourCompany.find_by(user_id: @user_now.id)
    end

    private
    def tour_company_params
        params.permit(:company_name, :description,:rating)
    end
end
