class CompoundMetricConfigurationsController < BaseMetricConfigurationsController
  before_action :set_metric_configurations, only: [:new, :edit]

  def create
    super
    metric_configuration.metric.compound = true
    respond_to do |format|
      create_and_redir(format)
    end
    Rails.cache.delete("#{params[:mezuro_configuration_id].to_i}_metric_configurations")
  end

  def show
    update_metric_configuration(@metric_configuration)
    super
  end

  def edit
    @compound_metric_configuration = @metric_configuration
    @compound_metric_configuration.configuration_id = params[:mezuro_configuration_id].to_i
  end

  def update
    respond_to do |format|
      edit
      if @compound_metric_configuration.update(metric_configuration_params)
        format.html { redirect_to mezuro_configuration_path(@compound_metric_configuration.configuration_id), notice: t('successfully_updated', :record => t('Compound' + @compound_metric_configuration.class.name)) }
        format.json { head :no_content }
      else
        failed_action(format, 'edit')
      end
      Rails.cache.delete("#{@compound_metric_configuration.configuration_id}_metric_configurations")
    end
  end

  protected

  def metric_configuration
    @compound_metric_configuration
  end

  def update_metric_configuration (new_metric_configuration)
    @compound_metric_configuration = new_metric_configuration
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def metric_configuration_params
    params[:metric_configuration]
  end

  # Duplicated code on create and update actions extracted here
  def failed_action(format, destiny_action)
    @mezuro_configuration_id = params[:mezuro_configuration_id]

    set_metric_configurations
    format.html { render action: destiny_action }
    format.json { render json: @compound_metric_configuration.errors, status: :unprocessable_entity }
  end

  #Code extracted from create action
  def create_and_redir(format)
    if @compound_metric_configuration.save
      format.html { redirect_to mezuro_configuration_path(@compound_metric_configuration.configuration_id), notice: t('successfully_updated', :record => t('Compound' + @compound_metric_configuration.class.name)) }
    else
      failed_action(format, 'new')
    end
  end

  def set_metric_configurations
    @metric_configurations = MetricConfiguration.metric_configurations_of(params[:mezuro_configuration_id].to_i)
  end

end
