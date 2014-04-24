module PatientsHelper

  def patient_statuses
    [[t("initial", :scope => :status), 'initial'],
      [t("referred", :scope => :status), 'referred'],
      [t("treatment", :scope => :status), 'treatment'],
      [t("closed", :scope => :status), 'closed']]
  end

end
