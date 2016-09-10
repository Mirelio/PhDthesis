import PyDSTool as dst
import numpy as np
from matplotlib import pyplot as plt
import seaborn as sns
from PyDSTool.Toolbox import phaseplane as pp


# we must give a name
DSargs = dst.args(name='Strogatz model')
# parameters
DSargs.pars = { 'r':-2
}

# parameter domains
#DSargs.pdomain = {
#    'p0':[0, 1000],'p3':[0, 1000],
#    'p1':[1, 4],    'p4':[1, 4],
#    'p2':[0, 5000],'p5':[0, 5000],
#    'p6':[0, 2]
#    }

# parameter domains
DSargs.pdomain = {'r':[-10,10]}
# rhs of the differential equations
DSargs.varspecs = {'x': 'r + x^2'}

DSargs.ics      = {'x': 1}

# domains of u and v
DSargs.xdomain = {'x': [0, 100]}

# time domain
DSargs.tdomain = [0,30]  

ode  = dst.Generator.Vode_ODEsystem(DSargs)     

# create an instance of the 'Generator' class.
ode  = dst.Generator.Vode_ODEsystem(DSargs)     

######################################################
## Simulate and plot a timecourse
#traj = ode.compute('test_trj')                  # integrate ODE
#pts  = traj.sample(dt=0.1)                      # Data for plotting

# PyPlot commands
#plt.plot(pts['t'], pts['u'] )
#plt.plot(pts['t'], pts['v'] )
#plt.xlabel('time')                              # Axes labels
#plt.ylabel('protein')                           # ...
#plt.ylim([0,12])                                # Range of the y axis
#plt.title(ode.name)                             # Figure title from model name
#plt.savefig("sp-gardner-timecourse.png")
#plt.close()

if 0:
    print "Running fixed points calculation"
    nx = 10
    xvals = np.linspace(5,20,nx)
    yvals = np.linspace(5,20,nx)
    res = np.zeros([nx,nx])
    for i in range(0,nx):
        for j in range(0,nx):
            ode.set(pars = {'a1': xvals[i], 'a2': xvals[j] } ) 
            fp_coords = pp.find_fixedpoints(ode, n=4, eps=1e-12)
            #print "n fixed points:", len(fp_coords), fp_coords

            nstable = 0
            for fp in fp_coords:
                try:
                    fpp = pp.fixedpoint_2D(ode, dst.Point(fp))
                    #print fpp.stability
                    if fpp.stability == "s":
                        nstable += 1
                except:
                    #print "not valid"
                    pass

                #if fp.stability == 's':
                #    print fp

            #print "n stable points:", nstable
            res[i,j] = nstable

    # make a basic plot
    points = np.zeros( [nx*nx,2] )
    nst = np.zeros( [nx*nx], dtype=np.int8 )
    count = 0
    for i in range(nx):
        for j in range(nx):
            points[count] = [xvals[i], yvals[j]]
            nst[count] = res[i,j]
            count += 1

    print nst
       
    # 0, 1, 2 steady state
    colormap = np.array(['r', 'g', 'b'])
    plt.scatter( points[:,0],  points[:,1], s=20, c=colormap[nst] )

    #plt.imshow(np.transpose(res),interpolation='none', origin='lower', extent=[xvals[0], xvals[nx-1], yvals[0], yvals[nx-1]])
    #plt.xlabel('a1')
    #plt.ylabel('a2')
    plt.savefig("sp-gardner-bistable-region-a1a2.png")
    plt.close()

######################################################
# Create the bifurcation diagram with respect to promoter strength, p0
if 1:
    sns.set_style("white")
    ## Prepare the system to start close to a steady state
    ode.set(pars = {'r':-1})             # Lower bound of the control parameter 'i'
    ode.set(ics =  {'x': -10} )              

    PC1 = dst.ContClass(ode)                        

    PCargs1 = dst.args(name='ba1', type='EP-C')      # 'EP-C' stands for Equilibrium Point Curve.
    
    PCargs1.StopAtPoints = ['B']

    PCargs1.freepars     = ['r']                     # control parameter(s) (it should be among those specified in DSargs.pars)
    PCargs1.MaxNumPoints = 10000                      # The following 3 parameters are set after trial-and-error
    PCargs1.MaxStepSize  = 10
    PCargs1.MinStepSize  = 1
    PCargs1.StepSize     = 10.0
    PCargs1.LocBifPoints = 'all'                       # detect limit points / saddle-node bifurcations
    PCargs1.SaveEigen    = True                       # to tell unstable from stable branches
    PC1.newCurve(PCargs1)
    PC1['ba1'].backward()
    PC1['ba1'].forward()
    
    PC1['ba1'].display(['r','x'], stability=True, figure=1)        # stable and unstable branches as solid and dashed curves, resp.
    PC1.plot.toggleLabels('off')

    plt.title('')
    plt.xlabel('r')
    #plt.axis([-10,4,0,15])
    sns.despine()
    plt.savefig("example_bifurc.png")
    plt.close()


# Create the bifurcation diagram with respect to leaky strength, p2

if 0:
    ## Prepare the system to start close to a steady state
    ode.set(pars = {'a1': 100.0 } )                    # Lower bound of the control parameter 'i'
    ode.set(ics =  {'u': 10, 'v': 100} )              # Close to one of the steady states present for i=-220

    PC2 = dst.ContClass(ode)                         # Set up continuation class

    PCargs2 = dst.args(name='ba2', type='EP-C')      # 'EP-C' stands for Equilibrium Point Curve.
    
    PCargs2.StopAtPoints = ['B']

    PCargs2.freepars     = ['a2']                     # control parameter(s) (it should be among those specified in DSargs.pars)
    PCargs2.MaxNumPoints = 1000                      # The following 3 parameters are set after trial-and-error
    PCargs2.MaxStepSize  = 10
    PCargs2.MinStepSize  = 1e-5
    PCargs2.StepSize     = 10.0
    PCargs2.LocBifPoints = 'all'                       # detect limit points / saddle-node bifurcations
    PCargs2.SaveEigen    = True                       # to tell unstable from stable branches
    PC2.newCurve(PCargs2)
    PC2['ba2'].backward()
    PC2['ba2'].forward()
    
    PC2['ba2'].display(['a2','u'], stability=True, figure=2)        # stable and unstable branches as solid and dashed curves, resp.
    PC2.plot.toggleLabels('off')

    plt.title('')
    plt.xlabel('leak strength a2')
    plt.axis([0,2000,0,100])
    plt.savefig("simp-gardner-bifurcation-a2.png")
    plt.close()


