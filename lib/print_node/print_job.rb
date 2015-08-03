require 'open-uri'
module PrintNode

  # This module provides API requests to Print Pdf files, Get printers detail,
  # View Print Pdf file jobs .

  class PrintJob

    attr_accessor :connection

    ALL_PRINTERS = '/printers'
    PDF_URL = '/printjobs'

    # Creates a new PrintNode::PrintJob instance.

    def initialize
      @connection = connection || PrintNode::Client.connection
    end

    # Get all Printers

    def get_printers
      response = @connection.get ALL_PRINTERS
      result = JSON.parse(response.body)
    end

    # Print Pdf File 
    # @param printer_id [Integer]
    # @param title [String]
    # @param content[String] pass the url of pdf file or online url of pdf file
    # @return id of print job

    def print_file(printer_id, title, content)
      begin
        pdf_content = open(content) {|io| io.read}
      rescue OpenURI::HTTPError
        return
      end
      main_content = Base64.encode64(pdf_content)
      params = {
        printerId:     printer_id.try(:to_i),
         title:           title,
        contentType:      "pdf_base64",
        content:      main_content,
        source:    "Web Interface"
      }
      response = @connection.post PDF_URL, params
    end

    #View All Print Jobs

    def view_print_jobs
      response = @connection.get PDF_URL
      result = JSON.parse(response.body)
    end

  end
end