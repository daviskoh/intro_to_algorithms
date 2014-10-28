package merge_sort_test

import (
	. "github.com/onsi/ginkgo"
	. "github.com/onsi/gomega"

	"testing"
)

func TestMergeSort(t *testing.T) {
	RegisterFailHandler(Fail)
	RunSpecs(t, "MergeSort Suite")
}
