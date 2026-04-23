// dummy_tb.cpp
// Prototype declaration matching fpu_top in fpu_stub.cpp
// Adjust types if your fpu_top uses different signatures
void fpu_top(bool rst_n, bool valid_in, int precision, int op, 
             unsigned long long a, unsigned long long b, 
             bool& valid_out, unsigned long long& result, int& ex);

int main() {
    // These variables act as dummy drivers
    bool valid_out = 0;
    unsigned long long result = 0;
    int ex = 0;

    // A single call to satisfy the HLS compiler check
    fpu_top(1, 0, 0, 0, 0, 0, valid_out, result, ex);
    
    return 0;
}