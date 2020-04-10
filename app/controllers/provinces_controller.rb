class ProvincesController < ApplicationController
    respond_to :json
    def view
        @provinces = Province.all
        respond_with(@provinces)
    end
end
