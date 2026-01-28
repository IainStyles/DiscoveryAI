function plotClusterImages(ClusterIndex,nRows,nCols)
    im=reshape(ClusterIndex,nRows,nCols);
    im = (im-1)/max(max(im));
    figure();
    imshow(im);
    colormap jet;
end