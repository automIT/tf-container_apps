# resource_group_name is derived from ../../../participant.yaml.
# Only override it here if needed:
# resource_group_name = "autworkshopcappXX"

welcome_html = <<-HTML
  <html>
  <head><title>Terraform Training</title></head>
  <body>
    <h1>Hallo aus Terraform!</h1>
    <p>Diese Seite kommt aus der Variable welcome_html.</p>
  </body>
  </html>
HTML
