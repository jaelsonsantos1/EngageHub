import pytest
from .connection import DBConnectionHandler

@pytest.mark.skip(reason="This test is not necessary")
def test_if_db_connection_handler_creates_engine():
    """Test if DBConnectionHandler creates engine"""

    db_connection_handle = DBConnectionHandler()
    engine = db_connection_handle.get_engine()
    assert engine is not None
