# test_store.py
from flask import jsonify
from ..store.app import app

def test_store_status():
    # Given
    client = app.test_client()

    # When
    response = client.get('/api/store/100')

    # Then
    assert response.status_code == 200
    assert response.content_type == 'application/json'
    data = response.get_json()
    assert "status" in data
    assert data["status"] == 0

def test_store_not_found():
    # Given
    client = app.test_client()

    # When
    response = client.get('/api/store/999')

    # Then
    assert response.status_code == 200
    assert response.content_type == 'application/json'
    data = response.get_json()
    assert "status" in data
    assert data["status"] == -1
