# frozen_string_literal: true

module Api
  module V1
    class UploadsController < ApplicationController
      # POST /api/v1/uploads
      def create
        @upload = Upload.new(csv_file: params[:csv_file])

        if @upload.save
          file = Upload.order(:created_at).last

          begin
            Uploads::Import.call(file: file)
          rescue ActiveRecord::RecordInvalid => e
            render json: { errors: e }, status: :unprocessable_entity
          else
            render json: { message: 'File imported successfully' }, status: :ok
          end
        else
          render json: { errors: @upload.errors }, status: :unprocessable_entity
        end
      end
    end
  end
end
