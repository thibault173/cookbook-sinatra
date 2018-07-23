require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file_path)
    @recipes = []
    @csv_file_path = csv_file_path
    CSV.foreach(csv_file_path) { |row| @recipes << Recipe.new(row[0], row[1], row[2], row[3], row[4]) }
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    # add recipe in CSV file
    write_recipes
  end

  def remove_recipe(index_recipe)
    @recipes.delete_at(index_recipe)
    # remove_recipe from csv file
    write_recipes
  end

  def write_recipes
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    CSV.open(@csv_file_path, 'wb', csv_options) do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.prep_time, recipe.mark?, recipe.rating.nil? ? "" : recipe.rating ]
      end
    end
  end

  def mark_as_done(recipe)
    recipe.mark_as_done
  end
end
