mat = csvread("PROCESSED_CSV.csv");
mat = mat(:,2)';
[l,c] = size(mat);
# save -float-binary dlog.bin mat
id = fopen("dlog2.bin", 'w');
fwrite(id,c,  "int64",0,"ieee-be");
fwrite(id,mat,"float32",0,"ieee-be"); #Writes with big-endian
fclose(id);
