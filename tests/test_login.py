import pytest
from src.login_validator import login, is_valid_email, is_strong_password


def test_valid_login():
    assert login("admin", "Admin@123") == "Login successful"


def test_invalid_password():
    assert login("admin", "wrong") == "Invalid credentials"


def test_empty_fields():
    assert login("", "") == "Username and password are required"


@pytest.mark.parametrize("email,expected", [
    ("user@example.com", True),
    ("user.name@college.edu.in", True),
    ("userexample.com", False),
    ("", False),
])
def test_email_validation(email, expected):
    assert is_valid_email(email) == expected


@pytest.mark.parametrize("password,expected", [
    ("Strong@123", True),
    ("weak", False),
    ("NoSpecial123", False),
    ("nouppercase@1", False),
])
def test_password_strength(password, expected):
    assert is_strong_password(password) == expected
