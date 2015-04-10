import numpy as np
import matplotlib.pyplot as plt

N = 4


ind = np.arange(N) # the x locations for the groups
width = 0.4       # the width of the bars

fig, ax = plt.subplots()

ax.set_ylim(0,11) # outliers only
#ax2.set_ylim(0,35) # most of the data

#ax.spines['bottom'].set_visible(False)
#ax2.spines['top'].set_visible(False)
ax.xaxis.tick_top()
#ax.tick_params(labeltop='off') # don't put tick labels at the top
ax.xaxis.tick_bottom()
fig.subplots_adjust(hspace=0.1)

# call-site-specific
noneV = (5.729, 6.966, 7.953, 8.524)
rectsNone = ax.bar(ind, noneV, width, color='w', hatch=' ')
#ax2.bar(ind, noneV, width, color='w')

# call-target-specific uncached
classCached = (2.560, 3.616, 5.357, 6.846)
rectsClassCached = ax.bar(ind+width, classCached, width, color='w', hatch='o')
#ax2.bar(ind+width, classCached, width, color='w', hatch='/')

# call-target-specific cached
#classUncached = (2.634, 3.358, 5.583, 6.838)
#rectsClassUncached = ax.bar(ind+2*width, classUncached, width, color='w', hatch='o')
#ax2.bar(ind+2*width, classUncached, width, color='w', hatch='o')



# add some text for labels, title and axes ticks
#ax2.set_ylabel('Runtime (ms)')
#ax.set_title('Average rendering runtime per frame')
ax.set_ylabel('Runtime (s) / 100.000 invocations')
ax.set_xticks(ind+width+0.14)
ax.set_xticklabels( ('(a) 1 target \n (10 kwargs)', '(b) 2 targets \n (10 kwargs; \n 10 kwargs)', '(c) 2 targets \n (10 kwargs; \n 5 kwargs + rest kwargs)', '(d) 1 target \n (5 kwargs + rest kwargs)') )
#ax2.set_yticks(ax2.get_yticks()[:-1])
ax.set_yticks(ax.get_yticks()[1:])

ax.legend( (rectsNone[0], rectsClassCached[0]), ('call-site-specific', 'call-target-specific') , loc=4)

def autolabel(rects):
    # attach some text labels
    for rect in rects:
        height = rect.get_height()
        if height == 0:
            ax.text(rect.get_x()+rect.get_width()/2., height+2, 'n/a',
                ha='center', va='bottom', rotation='vertical')       
        else:
            ax.text(rect.get_x()+rect.get_width()/2., height+0.2, '%.2f'%float(height),
                    ha='center', va='bottom', rotation='vertical')

autolabel(rectsNone)
autolabel(rectsClassCached)




plt.show()