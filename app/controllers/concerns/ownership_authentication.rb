module OwnershipAuthentication
  extend ActiveSupport::Concern

  def project_owner?
    check_project_ownership(params[:id])
  end

  def repository_owner?
    check_project_ownership(params[:project_id])
  end
  
  def reading_group_owner?
    if self.kind_of?(ReadingGroupsController)
      id = params[:id]
    elsif self.kind_of?(ReadingsController)
      id = params[:reading_group_id]
    else
      raise "Not supported"
    end

    check_reading_group_ownership(id)
  end

  def reading_owner?
    check_reading_group_ownership(params[:reading_group_id])
  end

  def check_project_ownership(id)
    if current_user.project_ownerships.find_by_project_id(id).nil?
      respond_to do |format|
        format.html { redirect_to projects_url, notice: "You're not allowed to do this operation" }
        format.json { head :no_content }
      end
    end
  end

  def check_reading_group_ownership(id)
    if current_user.reading_group_ownerships.find_by_reading_group_id(id).nil?
      respond_to do |format|
        format.html { redirect_to reading_group_url(id), notice: "You're not allowed to do this operation" }
        format.json { head :no_content }
      end
    end
  end
end
