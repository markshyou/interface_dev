# test_order.py
from flask import jsonify
from order.app import app

def test_products():
    # Given
    client = app.test_client()

    # When
    response = client.get('/api/order')

    # Then
    assert response.status_code == 200
    assert response.content_type == 'application/json'
    data = response.get_json()
    assert isinstance(data, list)

def test_order():
    # Given
    client = app.test_client()

    # When
    response = client.get('/api/order/1')

    # Then
    assert response.status_code == 200
    assert response.content_type == 'application/json'
    data = response.get_json()
    assert "name" in data
    assert "store" in data
    assert "storeId" in data
    assert "price" in data
    assert "img" in data
