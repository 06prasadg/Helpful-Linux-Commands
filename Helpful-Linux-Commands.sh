#listing files from subdirectories
ls -R | grep '.*[.]faa' # http://askubuntu.com/questions/307876/how-to-search-for-files-recursively-into-subdirectories
ls -R | grep ".*[0-9]_genomic.fna"

#listing files which DONT have same extenion
ls | grep -v  "_protein.faa"
find . -not -name "*_protein.faa"

# getting top of blast result of outfmt 6
sort -k1,1 -k12,12nr -k11,11n -k3,3nr blastout.txt | sort -u -k1,1 --merge > bestHits   #http://seqanswers.com/forums/showthread.php?t=23166
awk '!x[$1]++' blast.file >tophits.txt

#add path to bash_profile
export PATH=$PATH:~/opt/bin #where "/bin contains the software you want to run" #http://unix.stackexchange.com/questions/26047/how-to-correctly-add-a-path-to-pathcd

#To remove added path from $PATH
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

#split fasta file# https://stackoverflow.com/questions/21476033/splitting-a-multiple-fasta-file-into-separate-files-keeping-their-original-names 
awk '/^>XXX/ {OUT=substr($0,2) ".fa";print " ">OUT}; OUT{print >OUT}' your_input

#to find which entries is duplicated in certain column
awk 'x[$1]++ == 1 { print $1 " is duplicated"}' FILENAME  #http://www.unix.com/shell-programming-and-scripting/133472-find-duplicate-records-first-column-file.html

#to get difference in a file
fgrep -v -f file1 file2  #http://stackoverflow.com/questions/14473090/find-lines-from-a-file-which-are-not-present-in-another-file

#to check of file is tab separated or not
awk -F "\t" 'NF != 4' filename  #https://unix.stackexchange.com/questions/20544/how-to-check-if-a-file-is-tab-delimited-and-has-8-columns?rq=1
perl -ne '(s/\t//go)==3 or die "Not tabdelimitedand 4-columned"' filename

#greping somthing in particular column and recursive folder and in the files
grep -P "\trRNA\t" */*.gff | grep "16S"

#nw_display command to generate svg file from newick tree
nw_display -R 40 -s -v 20 -i 'opacity:0' -b 'visibility:hidden' -l 'font-family:san-serif' -w 1000 -W 10 out_root_order.tre > out_root_order.svg
nw_display -s -v 15 -i 'fill:red;font-size:0.05cm;font-family:Arial' -b 'visibility:hidden'  -w 15500 -W 80 faa_files.tree.nwk > faa_files_tree_root.svg
python protein_svg_modified.py all_fusobacterium_tree_root.svg /home/prasad/bioinfohd1_prasad/projects/gca_folders_for_static_seq_ids/finding_ncbi_ftp_folders_for_all_seqIDs_Found_STATIC.txt > out.txt

#making blast database
makeblastdb -in /Path/to/input.nuc.fa -dbtype nucl

#blast command for blasting query with db & modified btab output format 6
blastn -query final_16s_tree/concat_16s_rna.fa -db homd14.5_blast_db/HOMD_16S_rRNA_RefSeq_V14.5.fasta  -outfmt "6 qseqid sseqid qlen qstart qend slen sstart send length pident" -out out/concat_16s_rna_blast.btab
blastn -query in.fa -db 16s_microbial_db/16SMicrobial -outfmt "6 qseqid sseqid sscinames scomnames pident length qcovs qlen qstart qend slen sstart send" -num_threads 10 -out nout.btab #scientific name and common name

#remote blast command
/home/prasad/ncbi-blast-2.9.0+/bin/blastn -remote -db nr -query in.fa -outfmt "6 qseqid sseqid sscinames scomnames pident length qcovs qlen qstart qend slen sstart send" -out out.btab
#TOP 5 hits https://www.biostars.org/p/131329/
-max_hsps 5

#Replace character in string USINg Sed #https://stackoverflow.com/questions/3306007/replace-a-string-in-shell-script-using-a-variable
sed -e 's///g'
Eg:grep ">" HOMD_16S_rRNA_RefSeq_V15.2.fasta | cut -d "|" -f1,2 | grep -v "HMT" | sed -e 's/>//g' | sed -e 's/ | /\t/g' > 609_taxa_id_and_names_from_Homd_15.2_fasta_file.txt #replaced ">" and '|' with nothing and \t respectively

#DB error: connect failed
#Brop120 was down. Go to brop120 and check ps -a mysql | grep is running 
if its not running then then mysql.sock must be deleted or service mysqld stop  it will delete the mysql.sock file and then service mysqld start

#copy folder with folder name and its inside files to another folder
cp -avr */*/*/*/ test2/ #copying folders & insides files from folder called "test1" into test2

#creating folders if you have respective file name and copying those files in those folder
for file in `ls *.gz |sed 's/_R.*//g' |sort|uniq`; do mkdir Analysis/Sample_${file}; cp ${file}_R*_001.fastq.gz Analysis/Sample_${file}; echo $file >>Analysis/samples.txt; done


#if file dos coverted then use following command to convert it to unix
perl -p -e 's/\r$//' < winfile.txt > unixfile.txt  #https://kb.iu.edu/d/acux
 
 # find which file is not in particular diretory
 diff --brief -Nr dir1/ dir2/ #http://stackoverflow.com/questions/4997693/given-two-directory-trees-how-can-i-find-out-which-files-differ
 
#Replace whitespaces with tabs in linux
perl -p -i -e 's/ /\t/g' file.txt  #https://stackoverflow.com/questions/1424126/replace-whitespaces-with-tabs-in-linux
 
 #replace space with tab
 vi filename --> 1,$s/ / ^I/g

#just to print the duplicates of Line or Column  "sort file.txt | uniq -cd"
cut -f2 filename.txt | sort | uniq -cd #http://stackoverflow.com/questions/6712437/find-duplicate-lines-in-a-file-and-count-how-many-time-each-line-was-duplicated

#find if the content of one file exists or doesn't  exists in another file 
grep -f a.txt b.txt  #http://stackoverflow.com/questions/21128592/bash-text-search-find-if-the-content-of-one-file-exists-in-another-file
grep -v -f a.txt b.txt  #from line 18

#SCREEN linux
to start screen session: screen -S SessionName
enter commands to run in screen then ctrl+a+d = to detatch the screen
to retach screen -r SessionName

screen -X -S SessionName quit #https://stackoverflow.com/questions/1509677/kill-detached-screen-session

#find-lines-from-a-file-which-are-not-present-in-another-file
comm -13 <(sort -u file1) <(sort -u file2) #http://stackoverflow.com/questions/14473090/find-lines-from-a-file-which-are-not-present-in-another-file

#Copying Authorized key from one server to another server(the server in which you have to set up passwordless login)
ssh-copy-id -i ~/.ssh/id_rsa.pub user@remote-host #https://www.thegeekdiary.com/centos-rhel-how-to-setup-passwordless-ssh-login/

#Prokka annotation command  #for rrna use 2nd command which uses barrnap
Prokka --kingdom Bacteria --outdir test --genus TM7 --locustag tm7 --addgenes --addmrna --prefix tm7_pm ../tm7_genomes/TM7_PM_contig.fasta #https://github.com/tseemann/prokka#invoking-prokka
prokka --kingdom Bacteria --outdir selenomonas_190 --genus selenomonas --locustag S190 --prefix Selenomonas_190 GCA_001554015.1_ASM155401v1_genomic.fna
prokka --cpus 4 --rfam input/input.fasta --outdir prokka/outdir_name

prokka --outdir SEQF3103 --prefix SEQF3103 --locustag SEQF3103 fasta.fa  #this gives the folder name and header name same

#how-to-configure-xming-putty   
http://laptops.eng.uci.edu/software-installation/using-linux/how-to-configure-xming-putty

#GenemarkS
./gmsn.pl --format GFF --output at_vt1169.gff --prok --name at_vt1169_hmm.mod --fnn --faa GCA_001594245.1_ASM159424v1_genomic.fna

#grep certain organism or text from lines
grep "Treponema sp.\|Caulobacter sp." assembly_summary_genbank.txt > lines_extracted_from_assembly_report.txt

#Return only the portion of a line after a matching pattern
grep -o "ftp:.*" lines_extracted_from_assembly_report.txt > ftplink.txt #https://unix.stackexchange.com/questions/24140/return-only-the-portion-of-a-line-after-a-matching-pattern

#How to add a string at the beginning of each line in a file
perl -ne 'print "wget -Nr  --retr-symlinks $_"' ftplink.txt > wget_ftplink.txt #https://stackoverflow.com/questions/9588533/how-to-add-a-string-at-the-beginning-of-each-line-in-a-file

#How to add text at the end of each line in unix
awk '$0=$0"/"' wget_ftplink.txt > wget_ftplink_final.txt #https://stackoverflow.com/questions/23078897/how-to-add-text-at-the-end-of-each-line-in-unix

#nw_utils_comands
nw_reroot in.tree > out.tree
nw_reorder -cn out.tree > out_order.tree

#phpmyadmin location change in config.inc to add new host
/var/www/html/phpmyadmin    #after adding the host code in config file dont forget to add that host in hosts path mentioned below
#add hosts name to file 
sudo nano /etc/hosts  #http://mixeduperic.com/ubuntu/how-to-find-and-change-your-hostname-on-an-ubuntu-system.html

#Delete Empty Lines Using Sed / Grep Command in Unix (or Linux) #https://www.folkstalk.com/2012/02/delete-empty-lines-using-sed-grep.html
grep -v '^$' file.txt

#How To Retrieve Genbank Records With Range Of Accession Numbers
cat file_with_ids.txt | while read p; do echo $p; efetch -db nucleotide -id $p -format fasta > $p.fasta; done; #https://www.biostars.org/p/3297/

#location of development website ehomd_scripts
/mnt/homd90tb/LV1_dev/myBROP/var/www/html_ehomd/ehomd_modules/
#location of public website ehomd_scripts
/mnt/homd90tb/myBROP/var/www/html_ehomd/ehomd_modules/

#grep print header and next line  #https://unix.stackexchange.com/questions/320706/grep-search-next-line
grep -A1 -F "$line" HOMD_16S_rRNA_RefSeq_V15.2.fasta  #-A1 print the next line after matched line  #-F ignores special character in string for example see below
grep -A1 -F "Veillonellaceae [G-1] [G-1] bacterium HMT 129" HOMD_16S_rRNA_RefSeq_V15.2.fasta

#while loop implemented with grep command
cat only_hmt_taxa_names_sorted.txt | while read line; do grep -A1 -F "$line" HOMD_16S_rRNA_RefSeq_V15.2.fasta ; done > only_hmt_taxa_with_header_and_seq.fa

#multiline fasta to one line #https://www.biostars.org/p/9262/
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < file.fa > out.fa  #remove top empty line
awk '/^>/ { if(NR>1) print "";  printf("%s\n",$0); next; } { printf("%s",$0);}  END {printf("\n");}'

#BLAST taxdb error Warning: [blastn] Taxonomy name lookup from taxid requires installation of taxdb database with ftp://ftp.ncbi.nlm.nih.gov/blast/db/taxdb.tar.gz
export BLASTDB="/mnt/bioinfo/prasad/16s_rna_database/16s_microbial_db" #https://www.biostars.org/p/174244/
 
#Ignore pattern in a String using grep and while using grep  #https://unix.stackexchange.com/questions/114607/grep-to-ignore-patterns
grep '>' HOMD_16S_rRNA_RefSeq_V15.2.fasta | cut -d '|' -f2 | grep -v "HMT" #in this case header from fasta contains HMT but we wanted to ignore those header so used grep -v. which will print out headers which doesnt not contain HMT

#print duplicates lines only using uniq command #https://stackoverflow.com/questions/6712437/find-duplicate-lines-in-a-file-and-count-how-many-time-each-line-was-duplicated
sort top_65_98.5_perc_identity_sub_ids.txt | uniq -cd  #uniq -cd print duplicates strings with how many times it has been duplicated

#Add extenion to the files #https://askubuntu.com/questions/485525/how-to-mass-add-file-extension
for file in *; do echo mv -- "$file" "$file.jpg"; done

