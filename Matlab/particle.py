# particle class
import numpy as np

import matplotlib.pyplot as plt
import matplotlib.animation


class ParticleSystem:
    def __init__(self, num_particles, diam_array, pos_array, type_array, boxL):
        self.n_par = num_particles  # number of particles
        self.xs = pos_array  # numpy array of particle positions
        self.ds = diam_array  # numpy array of particle diameters
        self.types = type_array  # array of types
        self.boxL = boxL  # length of the side of the box

    def eps_lookup(typeA, typeB):
        return NotImplemented

    def potential(self):
        u_total = 0.
        # loop over all pairs of particles
        for i in range(self.n_par):
            for j in range(i + 1, self.n_par):
                sig = 0.5 * (self.ds[i] + self.ds[j])
                eps = 10.0  # TODO: use eps function
                u_total += self.u_lj(i, j, sig, eps)
        return u_total

    def dist(self, i, j):
        dx = self.xs[i, 0] - self.xs[j, 0]
        if abs(dx) > self.boxL / 2.0:
            dx = dx - self.boxL
        dy = self.xs[i, 1] - self.xs[j, 1]
        if abs(dy) > self.boxL / 2.0:
            dy = dy - self.boxL
        return np.sqrt(dx**2 + dy**2)

    def u_lj(self, i, j, sig, eps):
        rij = self.dist(i, j)
        rsig6 = (sig / rij)**6
        return (4 * eps) * (rsig6**2 - rsig6)

    def pbc(self, ind):
        # TODO implement a seperate function that does this correct_pbc(conf)
        """ This is explicitly what we need to do: can be done with a one liner
        if self.xs[ind, 0] > self.boxL / 2.0:
            self.xs[ind, 0] -= self.boxL
        if self.xs[ind, 0] < self.boxL / 2.0:
            self.xs[ind, 0] += self.boxL

        if self.xs[ind, 1] > self.boxL / 2.0:
            self.xs[ind, 1] -= self.boxL
        if self.xs[ind, 1] < self.boxL / 2.0:
            self.xs[ind, 1] += self.boxL
        """
        self.xs[ind] = self.xs[ind] - self.boxL * \
            (np.abs(self.xs[ind]) > (self.boxL / 2.0)) * np.sign(self.xs[ind])

    def mc_step(self, beta, scale):
        # compute initial energy
        Uinit = self.potential()
        # generate random displacement
        dxi = np.random.normal(loc=0, scale=scale, size=2)
        ind = np.random.randint(self.n_par)
        self.xs[ind] += dxi
        Ufinal = self.potential()
        # compute energy difference
        deltaU = Ufinal - Uinit
        # accept or reject?
        if deltaU < 0:
            self.pbc(ind)
            return self.xs
        if np.random.rand() < np.exp(-beta * deltaU):
            self.pbc(ind)
            return self.xs
        else:
            self.xs[ind] -= dxi
            return self.xs


def make_animation(traj, boxL, sig):
    fig, ax = plt.subplots(1, 1, figsize=(4, 4))
    ax.set_xlim(-boxL / 2, boxL / 2)
    ax.set_ylim(-boxL / 2, boxL / 2)
    l1, = ax.plot([], [], "o", markersize=sig)

    def animate(i):
        l1.set_data(traj[i, :, 0], traj[i, :, 1])

    return matplotlib.animation.FuncAnimation(fig, animate, frames=len(traj), interval=1)


def main():
    # create the particle system
    num_particles = 100
    boxL = 10
    xs_init = boxL * np.random.rand(num_particles, 2) - boxL / 2.0
    diams = np.ones(num_particles)
    types = None
    system = ParticleSystem(num_particles, diams, xs_init, types, boxL)
    # run a monte carlo trajectory with 100 steps
    beta = 1.0
    scale = 0.1
    n_steps = 1
    traj = np.zeros([n_steps, system.n_par, 2])
    energies = np.zeros([n_steps])
    for i in range(n_steps):
        system.mc_step(beta, scale)
        traj[i] = system.xs
        energies[i] = system.potential()
    # and collect the configurations
    make_animation(traj, boxL, 20)
    print(energies)
    plt.show()
    return


if __name__ == "__main__":
    main()
