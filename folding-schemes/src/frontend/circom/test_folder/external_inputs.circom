pragma circom 2.0.3;

template Another() {
    signal input inp_1; 
    signal input inp_2;

    signal output out;

    out <== inp_1 * inp_2;
}
/*
    z_{i+1} == z_i^3 + z_i * external_input[0] + external_input[1]
*/
template Example () {
    signal input ivc_input[1]; // IVC state
    signal input external_inputs[2]; // not state

    signal output ivc_output[1]; // next IVC state

    signal temp2;
    
    component m = Another();
    m.inp_1 <== ivc_input[0];
    m.inp_2 <== ivc_input[0];
    signal temp1 <== m.out;
    temp2 <== ivc_input[0] * external_inputs[0];
    ivc_output[0] <== temp1 * temp2;
}

component main {public [ivc_input]} = Example();
