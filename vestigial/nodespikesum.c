
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <unistd.h>

// Program for summing spike binary files from all used pGenesis nodes
// 
// Cell Classes:
// 1 - P23RS
// 2 - B23FS
// 3 - P5IB
// 4 - B5FS
// 5 - P6RS
// 6 - C23FS
// 7 - C5FS
// 8 - ST4RS
// 9 - I23LTS
// 10 - I5LTS
// 11 - TCR
// 12 - nRT


int main(int argc, char* argv[])
{

  FILE **spikefile, **spikefilea, **spikefileb, **spikefilec, **spikefiled;
  FILE *outfilegrid, *outfilesum;
  int Nnode_tot, Colpernode, Nfiles, CellClass, iflag4, Nsteps;
  int icurrnode, idex, jdex, jfinal;
  int Arrsize, Colsize, i, j, k, nt, ii, jj;
  float Runtime, Stepsize, binwrite, binread;
  float binreada, binreadb, binreadc, binreadd;
  char classname[100], classnamea[100], classnameb[100], classnamec[100], classnamed[100];
  char openname[100], opennamea[100], opennameb[100], opennamec[100], opennamed[100], opensuffix[100];
  char writenamegrid[100], writenamesum[100], buffer[100], buffername[100];
  char workingdir[100] = "/home/pol1/Data/GenesisData/Neocortex/Datahold/";
  char labelarraya[80], labelarrayb[80], labelarrayc[80], labelarrayd[80], labelarray[80];
  float starttimea, starttimeb, starttimec, starttimed, starttime;
  float stpsizea, stpsizeb, stpsizec, stpsized, stpsize;
  int ndataa, ndatab, ndatac, ndatad, ndata;
  int datatypea, datatypeb, datatypec, datatyped, datatype;
  int Summer4, Summer;

  int **Arrread, **Arrreada, **Arrreadb, **Arrreadc, **Arrreadd, **Arrwrite1, **Arrwrite4; /* Arrwrite[Arrsize][Arrsize] reading and writing swap arrays for data */


  if(argc<6)
    {
      fprintf(stderr,"\nUSAGE:\n\tnodespikesum <Nnode_tot> <Minicol/node> <Runtime (sec)> <Stepsize> <CellClass>\n");
      return 1;
    } 

  Nnode_tot=atoi(argv[1]);

  Colpernode=atoi(argv[2]);  

  Runtime=atof(argv[3]);

  Stepsize=atof(argv[4]);

  CellClass=atoi(argv[5]);

  Nfiles = Nnode_tot;

  Nsteps = Runtime/Stepsize;

  //printf("Nsteps = %i\n", Nsteps);

  Colsize = sqrt(Colpernode);

  Arrsize = Colsize*sqrt(Nnode_tot);

  //printf("Arrsize = %i\n", Arrsize);

  Arrread=(int**)malloc(Nnode_tot*sizeof(int*));        /* table allocation for temp Arrread array  */
  for(i=0;i<Nnode_tot;i++)
    Arrread[i]=(int*)malloc(Colpernode*sizeof(int));

  Arrreada=(int**)malloc(Nnode_tot*sizeof(int*));        /* table allocation for temp Arrreada array  */
  for(i=0;i<Nnode_tot;i++)
    Arrreada[i]=(int*)malloc(Colpernode*sizeof(int));

  Arrreadb=(int**)malloc(Nnode_tot*sizeof(int*));        /* table allocation for temp Arrreadb array  */
  for(i=0;i<Nnode_tot;i++)
    Arrreadb[i]=(int*)malloc(Colpernode*sizeof(int));

  Arrreadc=(int**)malloc(Nnode_tot*sizeof(int*));        /* table allocation for temp Arrreadc array  */
  for(i=0;i<Nnode_tot;i++)
    Arrreadc[i]=(int*)malloc(Colpernode*sizeof(int));

  Arrreadd=(int**)malloc(Nnode_tot*sizeof(int*));        /* table allocation for temp Arrreadd array  */
  for(i=0;i<Nnode_tot;i++)
    Arrreadd[i]=(int*)malloc(Colpernode*sizeof(int));

  Arrwrite1=(int**)malloc(Arrsize*sizeof(int*));        /* table allocation for temp Arrwrite1 array  */
  for(i=0;i<Arrsize;i++)
    Arrwrite1[i]=(int*)malloc(Arrsize*sizeof(int));

  Arrwrite4=(int**)malloc(2*Arrsize*sizeof(int*));        /* table allocation for temp Arrwrite4 array  */
  for(i=0;i<2*Arrsize;i++)
    Arrwrite4[i]=(int*)malloc(2*Arrsize*sizeof(int));

  spikefile=(FILE**)malloc(Nnode_tot*sizeof(FILE*));        /* table allocation for spikefile FILE array  */

  spikefilea=(FILE**)malloc(Nnode_tot*sizeof(FILE*));        /* table allocation for spikefilea FILE array  */

  spikefileb=(FILE**)malloc(Nnode_tot*sizeof(FILE*));        /* table allocation for spikefileb FILE array  */

  spikefilec=(FILE**)malloc(Nnode_tot*sizeof(FILE*));        /* table allocation for spikefilec FILE array  */

  spikefiled=(FILE**)malloc(Nnode_tot*sizeof(FILE*));        /* table allocation for spikefiled FILE array  */

  if ( (CellClass==1) || (CellClass==3) || (CellClass==5) )
       {

       iflag4=1;

       }
  else
       {

       iflag4=0;

       }

  //printf("iflag4 = %i\n", iflag4);

  if (CellClass==1){
      sprintf(classnamea,"P23RSaSPIKEbin");
      sprintf(classnameb,"P23RSbSPIKEbin");
      sprintf(classnamec,"P23RScSPIKEbin");
      sprintf(classnamed,"P23RSdSPIKEbin");
      //sprintf(classnamea,"P23RSaSPIKE");
      //sprintf(classnameb,"P23RSbSPIKE");
      //sprintf(classnamec,"P23RScSPIKE");
      //sprintf(classnamed,"P23RSdSPIKE");
  }
  else if (CellClass==2){
      sprintf(classname,"B23FSSPIKEbin");
      //sprintf(classname,"B23FSSPIKE");
  }
  else if (CellClass==3){
      sprintf(classnamea,"P5IBaSPIKEbin");
      sprintf(classnameb,"P5IBbSPIKEbin");
      sprintf(classnamec,"P5IBcSPIKEbin");
      sprintf(classnamed,"P5IBdSPIKEbin");
      //sprintf(classnamea,"P5IBaSPIKE");
      //sprintf(classnameb,"P5IBbSPIKE");
      //sprintf(classnamec,"P5IBcSPIKE");
      //sprintf(classnamed,"P5IBdSPIKE");
  }
  else if (CellClass==4){
      sprintf(classname,"B5FSSPIKEbin");
      //sprintf(classname,"B5FSSPIKE");
  }
  else if (CellClass==5){
      sprintf(classnamea,"P6RSaSPIKEbin");
      sprintf(classnameb,"P6RSbSPIKEbin");
      sprintf(classnamec,"P6RScSPIKEbin");
      sprintf(classnamed,"P6RSdSPIKEbin");
      //sprintf(classnamea,"P6RSaSPIKE");
      //sprintf(classnameb,"P6RSbSPIKE");
      //sprintf(classnamec,"P6RScSPIKE");
      //sprintf(classnamed,"P6RSdSPIKE");
  }
  else if (CellClass==6){
      sprintf(classname,"C23FSSPIKEbin");
      //sprintf(classname,"C23FSSPIKE");
  }
  else if (CellClass==7){
      sprintf(classname,"C5FSSPIKEbin");
      //sprintf(classname,"C5FSSPIKE");
  }
  else if (CellClass==8){
      sprintf(classname,"ST4RSSPIKEbin");
      //sprintf(classname,"ST4RSSPIKE");
  }
  else if (CellClass==9){
      sprintf(classname,"I23LTSSPIKEbin");
      //sprintf(classname,"I23LTSSPIKE");
  }
  else if (CellClass==10){
      sprintf(classname,"I5LTSSPIKEbin");
      //sprintf(classname,"I5LTSSPIKE");
  }
  else if (CellClass==11){
      sprintf(classname,"TCRSPIKEbin");
      //sprintf(classname,"TCRSPIKE");
  }
  else if (CellClass==12){
      sprintf(classname,"nRTSPIKEbin");
      //sprintf(classname,"nRTSPIKE");
  }

// File Utilities

  sprintf(writenamegrid,"/home/pol1/Data/GenesisData/Neocortex/Datahold/histo%i_out.dat",CellClass);

  if(!(outfilegrid=fopen(writenamegrid,"w")))
    {
      fprintf(stderr,"Can't open Output file: %s\n",writenamegrid);
        return 2;
    }

  sprintf(writenamesum,"/home/pol1/Data/GenesisData/Neocortex/Datahold/histo%isum_out.dat",CellClass);

  if(!(outfilesum=fopen(writenamesum,"w")))
    {
      fprintf(stderr,"Can't open Output file: %s\n",writenamesum);
        return 2;
    }

  strcpy(buffer,"");
  strcpy(buffername,"");

  for(i=0;i<Nnode_tot;i++)
    {

      //printf("i = %i\n", i);

      if ( iflag4==1 ){

	sprintf(opensuffix,".dat%i",i);
        strcpy(buffername, classnamea);
        strcat(buffername, opensuffix);
        strcpy(opennamea, buffername);
        strcpy(buffer, workingdir);
        strcat(buffer, opennamea);

        if(!(spikefilea[i]=fopen(buffer,"r")))
          {
          fprintf(stderr,"Can't open Spike file: %s\n",buffer);
          return 2;
          }

        fread(&labelarraya,80*sizeof(char),1,spikefilea[i]); 
        //printf("labelarraya = %s\n", labelarraya);
        fread(&starttimea,sizeof(float),1,spikefilea[i]); 
        //printf("starttimea = %f\n", starttimea);
        fread(&stpsizea,sizeof(float),1,spikefilea[i]); 
        //printf("stpsizea = %f\n", stpsizea);
        fread(&ndataa,sizeof(int),1,spikefilea[i]); 
        //printf("ndataa = %i\n", ndataa);
        fread(&datatypea,sizeof(int),1,spikefilea[i]); 
        //printf("datatypea = %i\n", datatypea);

        strcpy(buffer,"");
        strcpy(buffername,"");

	sprintf(opensuffix,".dat%i",i);
        strcpy(buffername, classnameb);
        strcat(buffername, opensuffix);
        strcpy(opennameb, buffername);
        strcpy(buffer, workingdir);
        strcat(buffer, opennameb);

        if(!(spikefileb[i]=fopen(buffer,"r")))
          {
          fprintf(stderr,"Can't open Spike file: %s\n",buffer);
          return 2;
          }

        fread(&labelarrayb,80*sizeof(char),1,spikefileb[i]); 
        //printf("labelarrayb = %s\n", labelarrayb);
        fread(&starttimeb,sizeof(float),1,spikefileb[i]); 
        //printf("starttimeb = %f\n", starttimeb);
        fread(&stpsizeb,sizeof(float),1,spikefileb[i]); 
        //printf("stpsizeb = %f\n", stpsizeb);
        fread(&ndatab,sizeof(int),1,spikefileb[i]); 
        //printf("ndatab = %i\n", ndatab);
        fread(&datatypeb,sizeof(int),1,spikefileb[i]); 
        //printf("datatypeb = %i\n", datatypeb);

        strcpy(buffer,"");
        strcpy(buffername,"");

	sprintf(opensuffix,".dat%i",i);
        strcpy(buffername, classnamec);
        strcat(buffername, opensuffix);
        strcpy(opennamec, buffername);
        strcpy(buffer, workingdir);
        strcat(buffer, opennamec);

        if(!(spikefilec[i]=fopen(buffer,"r")))
          {
          fprintf(stderr,"Can't open Spike file: %s\n",buffer);
          return 2;
          }

        fread(&labelarrayc,80*sizeof(char),1,spikefilec[i]); 
        //printf("labelarrayc = %s\n", labelarrayc);
        fread(&starttimec,sizeof(float),1,spikefilec[i]); 
        //printf("starttimec = %f\n", starttimec);
        fread(&stpsizec,sizeof(float),1,spikefilec[i]); 
        //printf("stpsizec = %f\n", stpsizec);
        fread(&ndatac,sizeof(int),1,spikefilec[i]); 
        //printf("ndatac = %i\n", ndatac);
        fread(&datatypec,sizeof(int),1,spikefilec[i]); 
        //printf("datatypec = %i\n", datatypec);

        strcpy(buffer,"");
        strcpy(buffername,"");

	sprintf(opensuffix,".dat%i",i);
        strcpy(buffername, classnamed);
        strcat(buffername, opensuffix);
        strcpy(opennamed, buffername);
        strcpy(buffer, workingdir);
        strcat(buffer, opennamed);

        if(!(spikefiled[i]=fopen(buffer,"r")))
          {
          fprintf(stderr,"Can't open Spike file: %s\n",buffer);
          return 2;
          }

        fread(&labelarrayd,80*sizeof(char),1,spikefiled[i]); 
        //printf("labelarrayd = %s\n", labelarrayd);
        fread(&starttimed,sizeof(float),1,spikefiled[i]); 
        //printf("starttimed = %f\n", starttimed);
        fread(&stpsized,sizeof(float),1,spikefiled[i]); 
        //printf("stpsized = %f\n", stpsized);
        fread(&ndatad,sizeof(int),1,spikefiled[i]); 
        //printf("ndatad = %i\n", ndatad);
        fread(&datatyped,sizeof(int),1,spikefiled[i]); 
        //printf("datatyped = %i\n", datatyped);

      }
 
      else{

	sprintf(opensuffix,".dat%i",i);
        strcpy(buffername, classname);
        strcat(buffername, opensuffix);
        strcpy(openname, buffername);
        strcpy(buffer, workingdir);
        strcat(buffer, openname);

        if(!(spikefile[i]=fopen(buffer,"r")))
          {
          fprintf(stderr,"Can't open Spike file: %s\n",buffer);
          return 2;
          }
     
        fread(&labelarray,80*sizeof(char),1,spikefile[i]); 
        //printf("labelarray = %s\n", labelarray);
        fread(&starttime,sizeof(float),1,spikefile[i]); 
        //printf("starttime = %f\n", starttime);
        fread(&stpsize,sizeof(float),1,spikefile[i]); 
        //printf("stpsize = %f\n", stpsize);
        fread(&ndata,sizeof(int),1,spikefile[i]); 
        //printf("ndata = %i\n", ndata);
        fread(&datatype,sizeof(int),1,spikefile[i]); 
        //printf("datatype = %i\n", datatype);

        strcpy(buffer,"");
        strcpy(buffername,"");

      }

    }

// Data Read Loop

  for (nt=0;nt<Nsteps;nt++){

      //printf("nt = %i\n", nt);

     Summer4 = 0;
     Summer = 0; 

     for(i=0;i<Nnode_tot;i++)
        {

	    //printf("i = %i\n", i);

	    if ( iflag4==1 ){

                for(j=0;j<Colpernode;j++){

		    //printf("j = %i\n", j);

                      fread(&binreada,sizeof(float),1,spikefilea[i]); 
		      Arrreada[i][j] = round(binreada);

                      Summer4 = Summer4 + Arrreada[i][j];

                      //if ( binreada>0 ){		      
		      //printf("Arrreada[%i][%i] = %i\n", i,j,Arrreada[i][j]);
                      //}

                      fread(&binreadb,sizeof(float),1,spikefileb[i]); 
		      Arrreadb[i][j] = round(binreadb);

                      Summer4 = Summer4 + Arrreadb[i][j];

                      //if ( binreadb>0 ){		      
		      //printf("Arrreadb[%i][%i] = %f\n", i,j,binreadb);
                      //}

                      fread(&binreadc,sizeof(float),1,spikefilec[i]); 
		      Arrreadc[i][j] = round(binreadc);

                      Summer4 = Summer4 + Arrreadc[i][j];

                      //if ( binreadc>0 ){		      
		      //printf("Arrreadc[%i][%i] = %f\n", i,j,binreadc);
                      //}

                      fread(&binreadd,sizeof(float),1,spikefiled[i]); 
		      Arrreadd[i][j] = round(binreadd);

                      Summer4 = Summer4 + Arrreadd[i][j];

                      //if ( binreadd>0 ){		      
		      //printf("Arrreadd[%i][%i] = %f\n", i,j,binreadd);
                      //}

	        } 

            }

            else{
            
                  for(j=0;j<Colpernode;j++){

                      fread(&binread,sizeof(float),1,spikefile[i]); 
		      Arrread[i][j] = round(binread);

                      Summer = Summer + Arrread[i][j];

	          } 
                  
	        }

        }

        if ( iflag4==1 ){

          for(ii=0;ii<Arrsize;ii++)
          {

	     //printf("ii = %i\n", ii);

             for(jj=0;jj<Arrsize;jj++)
             {

	     //printf("jj = %i\n", jj);

	     icurrnode = floor(jj/Colsize) + sqrt(Nnode_tot)*floor(ii/Colsize);
             idex = ii - Colsize*floor(ii/Colsize);
             jdex = jj-Colsize*floor(jj/Colsize);
             jfinal = idex*Colsize + jdex;

             Arrwrite4[2*ii][2*jj] = Arrreada[icurrnode][jfinal];
             Arrwrite4[2*ii][2*jj+1] = Arrreadb[icurrnode][jfinal];
             Arrwrite4[2*ii+1][2*jj] = Arrreadc[icurrnode][jfinal];
             Arrwrite4[2*ii+1][2*jj+1] = Arrreadd[icurrnode][jfinal];

             }

          }

        }

        else {

          for(ii=0;ii<Arrsize;ii++)
          {

             for(jj=0;jj<Arrsize;jj++)
             {

	     icurrnode = floor(jj/Colsize) + sqrt(Nnode_tot)*floor(ii/Colsize);
             idex = ii - Colsize*floor(ii/Colsize);
             jdex = jj-Colsize*floor(jj/Colsize);
             jfinal = idex*Colsize + jdex;

             Arrwrite1[ii][jj] = Arrread[icurrnode][jfinal];


             }

          }

        } 

// Write output file (Case of iflag4=1 or 0)

    if (iflag4==1){


          for(ii=0;ii<2*Arrsize;ii++)
          {

	      //printf("ii = %i\n", ii);

             for(jj=0;jj<2*Arrsize;jj++)
             {

	         //printf("jj = %i\n", jj);

		 fwrite(&Arrwrite4[ii][jj],sizeof(int),1,outfilegrid);

             }

          }

          fwrite(&Summer4,sizeof(int),1,outfilesum);

          //if ( Summer4>0 ){		      
	  // printf("nt = %i Summer4 = %i\n", nt,Summer4);
          //}

    }  

    else{

          for(ii=0;ii<Arrsize;ii++)
          {

             for(jj=0;jj<Arrsize;jj++)
             {

		 fwrite(&Arrwrite1[ii][jj],sizeof(int),1,outfilegrid);

             }

          }

          fwrite(&Summer,sizeof(int),1,outfilesum);

    }

  } // End of Time Step Loop

  // Closing files

  fclose(outfilegrid);
  fclose(outfilesum);

  for(i=0;i<Nnode_tot;i++)
    {

      if ( iflag4==1 ){

	  fclose(spikefilea[i]);

          fclose(spikefileb[i]);

          fclose(spikefilec[i]);

          fclose(spikefiled[i]);

      }
 
      else{

	  fclose(spikefile[i]);
     
      }


    }

}
