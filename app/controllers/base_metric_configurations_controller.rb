include OwnershipAuthentication
include MetricConfigurationsConcern
include ResourceFinder

class BaseMetricConfigurationsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :metric_configuration_owner?, only: [:edit, :update, :destroy]
  before_action :kalibro_configuration_owner?, only: [:new, :create, :choose_metric]
  before_action :set_metric_configuration, only: [:show, :edit, :update, :destroy]

  def new
    update_metric_configuration(MetricConfiguration.new)
  end

  def show
    if metric_configuration
      @reading_group = ReadingGroup.find(metric_configuration.reading_group_id)
      @kalibro_ranges = metric_configuration.kalibro_ranges
    else
      raise NotImplementedError
    end
  end

  def create
    update_metric_configuration(MetricConfiguration.new(metric_configuration_params))
  end

  protected

  def metric_configuration
    raise NotImplementedError
  end

  def update_metric_configuration (new_metric_configuration)
    raise NotImplementedError
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  # TODO: this should be refactored to the concern metric configuration
  def metric_configuration_params
    params[:metric_configuration]
  end
end
