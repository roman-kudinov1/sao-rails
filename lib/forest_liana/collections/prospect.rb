class Forest::Prospect
  include ForestLiana::Collection

  collection :prospects
  action 'Get SA', global: true
  action 'Get SARL', global: true
end