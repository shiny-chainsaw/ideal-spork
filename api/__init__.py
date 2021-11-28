from flask import Flask


def create_app():
    app = Flask(__name__)

    @app.route("/health")
    def health():
        return "", 200

    return app
