json.array!(@patients) do |patient|
  json.extract! patient, :id, :first_name, :middle_name, :last_name, :birthday, :gender, :status, :location, :view_count
  json.url patient_url(patient, format: :json)
end
