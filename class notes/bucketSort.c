//Bucket Sort for numbers between 0 and 1
#include<stdio.h>
float buckets[12][12];
int sizes[13];

void InsertionSort(float arr[],int size){
    if(size==0 || size==1) return;
    for(int i=0;i<size;i++){
        for(int j=i-1;j>=0;j--){
            if(arr[j]>arr[i]){
                float temp = arr[j];
                arr[j] = arr[i];
                arr[i] = temp;
            }
        }   
    }
}
int bucketSort(float arr[],int n){
    // int 
    for(int i=0;i<13;i++){
        sizes[i]=0;
    }
    for(int i=0;i<n;i++){
            int bi = n*arr[i];
            // if(arr[j]>=(i*0.1) && arr[j]<((i+1)*0.1)){
            buckets[bi][sizes[bi]++]=arr[i];
    }
    for(int i=0;i<n;i++){
        InsertionSort(buckets[i], sizes[i]);
    }
}

// void initializeBuckets(){
//     for(int i=0;i<13;i++){
//         for(int j=0;j<13;j++){
//             buckets[i][j]=-1.0;
//         }
//     }
// }

void printBuckets(){
    for(int i=0;i<13 ;i++){
        for(int j=0;j<sizes[i];j++){
                printf("%f ",buckets[i][j]);
        }
    }
}

int main(){
    // initializeBuckets();
    float arr[]
        // = { 0.897, 0.565, 0.656, 0.1234, 0.665, 0.3434 };
        ={ 0.897, 0.565, 0.656, 0.1234, 0.665, 0.3434, 0.1126, 0.554, 0.3349, 0.678, 0.3656, 0.9989 };
    int n = sizeof(arr) / sizeof(arr[0]);
    bucketSort(arr,n);

    printBuckets();
}
