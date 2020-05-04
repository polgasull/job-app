# frozen_string_literal: true

module Admins
  class JobsController < Admins::AdminsController
    before_action :set_job, only: [:edit, :update, :destroy]

    def index
      @jobs = Job.all.filter(params).order('created_at DESC')
      @jobs_active_count = @jobs.not_expired.count
      @jobs_expired_count = @jobs.expired.count
      @jobs_count = @jobs.count  
    end

    def new
      @job = current_user.jobs.build
    end

    def edit; end

    def create
      @job = current_user.jobs.build(job_params)
      
      reference = @job.reference = "wah#{DateTime.now.year}#{SecureRandom.hex(3)}"
    
      if @job.save
        redirect_to_response(t('jobs.messages.job_created'), @job) 
      else 
        redirect_back_response(t('jobs.messages.job_not_created'), false)
      end
    end
  
    def update
      @job.update(job_params) ? redirect_to_response(t('jobs.messages.job_updated'), @job) : redirect_back_response(t('jobs.messages.job_not_updated'), false)
    end
  
    def destroy
      @job.taggings.destroy_all
      @job.inscriptions.destroy_all
      @job.destroy ? redirect_back_response(t('jobs.messages.job_deleted')) : redirect_back_response(t('jobs.messages.job_not_deleted'), false)
    end

    private

    def set_job
      @job = Job.find(params[:id])
    end
  
    def job_params
      params.require(:job).permit!
    end
  end
end