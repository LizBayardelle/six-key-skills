class Sitting < ApplicationRecord
  belongs_to :user
  belongs_to :quiz
  before_save :compile_results
  before_save :compile_percentages

  def compile_results
    results = self.results
    possible = self.possible_results

    results_array = results.split(",")
    possible_array = possible.split(",")

    nested_results_array = []
    results_array.each { |thing|
      inter1 = thing.split("=")
      inter2 = []
      inter2 << inter1[0].to_s
      inter2 << inter1[1].to_i
      nested_results_array << inter2
    }

    nested_possible_array = []
    possible_array.each { |thing|
      inter1 = thing.split("=")
      inter2 = []
      inter2 << inter1[0].to_s
      inter2 << inter1[1].to_i
      nested_possible_array << inter2
    }

    self.compiled_results = nested_results_array.group_by { |measured, amount| measured }
      .map { |k, measured_arr| [k, measured_arr.flat_map(&:last).sum] }

    self.possible_compiled_results = nested_possible_array.group_by { |measured, amount| measured }
      .map { |k, measured_arr| [k, measured_arr.flat_map(&:last).sum] }
  end

  def compile_percentages
    percentages = []

    n = 0
    self.compiled_results.each { |x|
      item = []
      item << self.compiled_results[n][0]
      perc = self.compiled_results[n][1].to_f / self.possible_compiled_results[n][1].to_f
      item << perc
      percentages << item
      n += 1
    }

    self.compiled_percentages = percentages

  end

end
