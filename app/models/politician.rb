class Politician < ActiveRecord::Base
  hstore_accessor :hash_data,
  title: :string,
  firstname: :string,
  middlename: :string,
  lastname: :string,
  name_suffix: :string,
  nickname: :string,
  party: :string,
  state: :string,
  district: :string,
  in_office: :string,
  gender: :string,
  phone: :string,
  fax: :string,
  website: :string,
  webform: :string,
  congress_office: :string,
  bioguide_id: :string,
  votesmart_id: :string,
  fec_id: :string,
  govtrack_id: :string,
  crp_id: :string,
  twitter_id: :string,
  congresspedia_url: :string,
  youtube_url: :string,
  facebook_id: :string,
  official_rss: :string,
  senate_class: :string,
  birthdate: :string,
  oc_email: :string,
  bio: :text
end
