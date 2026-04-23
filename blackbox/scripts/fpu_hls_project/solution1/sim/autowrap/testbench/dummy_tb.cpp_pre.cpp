# 1 "C:/Users/umbre/Downloads/FPGAs-Proyecto-Final/blackbox/tb/dummy_tb.cpp"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 420 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "C:/Users/umbre/Downloads/FPGAs-Proyecto-Final/blackbox/tb/dummy_tb.cpp" 2



void fpu_top(bool rst_n, bool valid_in, int precision, int op,
             unsigned long long a, unsigned long long b,
             bool& valid_out, unsigned long long& result, int& ex);

int main() {

    bool valid_out = 0;
    unsigned long long result = 0;
    int ex = 0;


    fpu_top(1, 0, 0, 0, 0, 0, valid_out, result, ex);

    return 0;
}
