# test_user.py
from flask import jsonify, session
from ..user.app import app

def test_index():
    # Given
    client = app.test_client()

    # When
    response = client.get('/')

    # Then
    assert response.status_code == 200
    assert b'Hello, World!' in response.data

def test_authenticated_index():
    # Given
    client = app.test_client()
    with client.session_transaction() as sess:
        sess['username'] = 'test_user'

    # When
    response = client.get('/')

    # Then
    assert response.status_code == 200
    assert b'Hello, test_user!' in response.data

def test_login():
    # Given
    client = app.test_client()

    # When
    response = client.get('/w/login')

    # Then
    assert response.status_code == 200
    assert b'Login' in response.data

def test_authenticated_login():
    # Given
    client = app.test_client()
    with client.session_transaction() as sess:
        sess['username'] = 'test_user'

    # When
    response = client.get('/w/login')

    # Then
    assert response.status_code == 200
    assert b'Hello, test_user!' in response.data
