# The_optimal_distribution_ratio_of_braking_force
Apply the Particle Swarm Optimization (PSO) algorithm to optimize the parameters of the electro-hydraulic braking system.
## 1. Brake energy recovery power
The energy recovery power is proposed as a performance indicator to evaluate the energy recovery efficiency of the electro-hydraulic braking system. The equations describe the process of brake energy recovery in the form of electrical energy:

![fomula1](https://github.com/trunggpham/The_optimal_distribution_ratio_of_braking_force/blob/main/fomula1.png)
![The relationship between the coefficient of friction and braking efficiencyl](https://github.com/trunggpham/The_optimal_distribution_ratio_of_braking_force/blob/main/The%20relationship%20between%20the%20coefficient%20of%20friction%20and%20braking%20efficiency.png) 

Where:

- $I_d$ - Armature current;
- $R$ is the armature resistance;
- $k_e$ - Motor back EMF constant;
- $x_m$ is the motor speed;
- $d$ - Duty cycle;
- $R_w$ is the wheel radius;
- $F$ is the braking force;
- $k_T$ - Motor torque constant;
- $a$ is the brake force distribution ratio between electric brake and hydraulic brake;
- $I_b$ is the charging current;
- $U_b$ is the charging voltage.

The recoverable energy power can be obtained as follows:

$P = rF \left[ R rF + k_e k_T \omega_m \left( \frac{1}{1 + \alpha} \right) \right] / k_T^2 \left( \frac{1}{1 + \alpha} \right)^2$

## 2. Braking efficiency

As definition of braking efficiency:

![fomula2](https://github.com/trunggpham/The_optimal_distribution_ratio_of_braking_force/blob/main/fomula2.png)

![The relationship between the utilized coefficient of friction and braking force.png](https://github.com/trunggpham/The_optimal_distribution_ratio_of_braking_force/blob/main/The%20relationship%20between%20the%20utilized%20coefficient%20of%20friction%20and%20braking%20force.png)

## 3. Utilized coefficient of friction

![image](https://github.com/user-attachments/assets/5832b2ff-5b42-4eb9-9c38-2872d6fb97bb)

where:

- $F_{xbf}$ and $F_{xbr}$ are the braking forces of the front and rear axles, respectively;

- $F_{zf}$ and $F_{zr}$ are the normal forces of the front and rear axles, respectively;

- $a$ and $b$ are the distances from the front axle to the center of gravity;

- $S_3$ and $S_4$ are the areas where the adhesion coefficients $\varphi_r$, $\varphi_f$, and $u = \varphi = z$ are respectively enclosed.

- The smaller the sum of $S_3$ and $S_4$, the more the adhesion coefficient used is close to the braking intensity and the more reasonable the brake force distribution.

## 4. Particle Swarm Optimization (PSO) algorithm

![image](https://github.com/user-attachments/assets/5ca822c3-f1c5-4d44-8767-259c7a987523)


