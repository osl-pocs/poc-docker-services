import http.server
import socketserver

class SimpleHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-type", "text/html")
        self.end_headers()
        self.wfile.write(b"<html><body><h1>Hello, World!</h1></body></html>")

PORT = 8000

with socketserver.TCPServer(("", PORT), SimpleHandler) as httpd:
    print(f"Server running at http://localhost:{PORT}")
    httpd.serve_forever()
