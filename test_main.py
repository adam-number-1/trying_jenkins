import pytest
from main import *

class TestFn:

    @pytest.mark.parametrize("input,output",[(2,4),(3,6)])
    def test_double(self, input, output):
        assert double(input) == output

    @pytest.mark.parametrize("input,output",[(2,6),(3,9)])
    def test_triple(self, input, output):
        assert triple(input) == output

    @pytest.mark.parametrize("input,output",[((2,4),6),((5,4),9)])
    def test_add(self, input, output):
        assert add(*input) == output