from mpi4py import MPI
import socket

comm = MPI.COMM_WORLD
global_rank = comm.Get_rank()

# -- Split by shared memory node --
local_comm = comm.Split_type(MPI.COMM_TYPE_SHARED)
local_rank = local_comm.Get_rank()

print(f"Global rank: {global_rank}, Local rank: {local_rank}, Hostname: {socket.gethostname()}")

