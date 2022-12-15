import matplotlib.pyplot as plt
from cluster import Cluster
import os

class View:
    def save_file(new_cluster: Cluster):
        index = 0

        for group in new_cluster.get_groups():
            mid = group.get_mid()
            x = [mid[0]]
            y = [mid[1]]

            for data in group.get_data():
                attrs = data.get_attrs()
                x.append(attrs[0])
                y.append(attrs[1])
            
            plt.scatter(x, y, label=f'Grupo {index}')
            index += 1
        
        plt.xlabel("Eixo X")
        plt.ylabel("Eixo Y")
        plt.title("Agrupamento")
        plt.legend()
        # plt.show()
        plt.savefig(os.path.join(os.getcwd(), 'outputs', 'output.png'))
        plt.close()