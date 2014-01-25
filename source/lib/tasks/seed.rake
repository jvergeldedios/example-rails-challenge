require 'seed'

task seed: :environment do
  Seed.perform
end