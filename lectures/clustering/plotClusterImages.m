function plotClusterImages(ClusterIndex,nRows,nCols)
    im=reshape(ClusterIndex,nRows,nCols);
    im = (im-1)/max(max(im));
    figure();
    imagesc(im);
    colormap jet;
    axis equal;
    axis off;
end