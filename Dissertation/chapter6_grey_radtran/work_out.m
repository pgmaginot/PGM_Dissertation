c = sym('c','positive')
% c = 4\pi \Delta t a_{ii}

% A = \mathbf{R}_{\sigma_a}
A = sym('A',[2 2])

% V = \mathbf{R}_{C_v}
V = sym('V' , [2 2])

D = sym('D' , [2 2])
D(1,2) = 0;
D(2,1) = 0;

I = sym('I' , [2 2] );
I(1,1) = 1;
I(1,2) = 0;
I(2,1) = 0;
I(2,2) = 1;

cv_inv = inv(V)

const = I + c*cv_inv*A*D

inv_const = inv(const)

nu_sig_a = c*A*D*inv_const*cv_inv*A

fprintf('\n\n Self-lumping \n\n')

A_sl = sym('A_sl',[2 2]);
A_sl(2,1) = 0;
A_sl(1,2) = 0;

Cv_sl = sym('cv_sl',[2 2]);
Cv_sl(1,2) = 0;
Cv_sl(2,1) = 0;

Cv_sl_inv = inv(Cv_sl)

const_sl = I + c*Cv_sl_inv*A_sl*D

inv_const_sl = inv(const_sl)

nu_sig_a_sl = c*A_sl*D*inv_const_sl*A_sl

D1 = sym('D1',[2 2]);
D2 = sym('D2', [2 2]);
D1(1,2) = 0;
D1(2,1) = 0;
D2(1,2) = 0;
D2(2,1) = 0;

D2*D1


D1*D2