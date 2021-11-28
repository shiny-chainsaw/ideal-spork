import pytest

import api


@pytest.fixture
def app():
    return api.create_app()


@pytest.fixture
def client(app):
    return app.test_client()
