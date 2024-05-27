
#------3D HeatMap-------------
library(ComplexHeatmap)
library(RColorBrewer)
library(circlize)
library(dendextend)
library(ggplot2)

mydata       <- read.csv("/Users/jyc_mac/BaiduCloud/Project/enigma/statistical_analysis/zROI_Race/Trajectory/HeatMap/Similarity_subtype0.csv")

mat = data.matrix(mydata[2:8])
mat[mat < 0] <- 0

rownames(mat) = mydata[1:7,1]

bar3D(x = 0.5, y = 0.5, w = 0.2,
      h = 0.2, l = unit(1, "cm"), theta = 60)

#brewer.pal(n = 9, name = "Blues") #构造颜色映射方案
f1 = colorRamp2(seq(0.4,1,length = 4), c("#EEEEEE","green","yellow","red"))

#mycol=c("#F7FBFF","#9ECAE1","#6BAED6","#4292C6","#2171B5","#08519C","#08306B","#08306B")


ht_opt$HEATMAP_LEGEND_PADDING = unit(6,"mm") # 设置标题 和 图例位置
ht_opt$TITLE_PADDING = unit(c(6,2),"mm")

colormap <- colorRampPalette(rev(brewer.pal(n = 7, name = "Blues")))(10)
Heatmap(mat, col = f1, name = "r value", column_title = "Trajectory 1",
        rect_gp = gpar(col = "white", lwd = 2),  # 设置线宽，线形
          show_heatmap_legend = TRUE,heatmap_legend_param = list(title_position = "topleft"),
          cluster_rows = FALSE,cluster_columns = FALSE,
      #    show_column_dend = TRUE, show_row_dend = TRUE, 
          show_column_names = TRUE,row_names_max_width = unit(10, "cm"),column_names_side = "bottom",column_names_gp = gpar(fontsize = 10),
          show_row_names = TRUE,row_names_side = "left", row_names_gp = gpar(fontsize = 10))


