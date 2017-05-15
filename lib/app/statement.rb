class Statement

  attr_reader :all, :formatted

  def initialize
    @all = []
    @formatted = ["date || amount || type || balance"]
  end

  def add_transaction(transaction)
    self.all.push(transaction)
  end


  def print_statement
    # self.print_header
    self.format_transactions
    self.formatted
  end

  # def print_header
  #
  # end

  def format_transactions
    self.formatted = ["date || amount || type || balance"]
    self.all.each do |hash|
      self.formatted.push("#{hash[:date]} || £#{hash[:amount]} || #{hash[:type]} || £#{hash[:balance]}")
    end
  end

  private
  attr_writer :formatted

end
