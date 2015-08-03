require 'print_node'

# configure the client
client = PrintNode::Client.new.tap do |config|
  config.username      = ENV['USERNAME']
  config.password      = ENV['PASSWORD']
end


# PrintPdf and get printers detail  examples

printer_detail = PrintNode::PrintJob.new(username: 'your-print_node_api_username', password: 'your-print_node_api_password')
# get all printer
results = printer_detail.get_printers

#Print pdf file
response = printer_detail.print_file(51012, 'SecondPdfFile',  '/home/enbake/Pictures/printnodepic/label_4in_x_6in_ups.pdf')

#View Print Jobs
response = printer_detail.view_print_jobs